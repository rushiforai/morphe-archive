/*
 * Copyright 2026 PrathxmOp
 * https://github.com/PrathxmOp/Prathxm-Patches
 *
 * Ported into Noam's chess.com patches (GPL-3.0).
 */

package app.noam.extension.chesscom.gamereview;

import android.util.Log;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;

/** Entry points the Game Review patch's bytecode hooks call into. */
public final class GameReviewExtension {
    private static final String TAG = "GameReviewExtension";

    private GameReviewExtension() {}

    /**
     * Game Review entry point: the repository receives a ComputerAnalysisConfiguration whose
     * PGN is replayed through the local engine.
     *
     * @param flowClass the app's (obfuscated) coroutine Flow interface, supplied by the patch
     */
    public static Object getLocalAnalysisFlowForConfig(Class<?> flowClass, Object config) {
        String pgn = null;
        if (config instanceof String) {
            pgn = (String) config;
        } else if (config != null) {
            try {
                Object v = config.getClass().getMethod("getPgn").invoke(config);
                if (v instanceof String) pgn = (String) v;
            } catch (Throwable ignored) {}
        }
        return LocalAnalysisFlow.createFlow(flowClass, pgn);
    }

    public static Object getFullGameAnalysisPermissions() {
        try {
            Class<?> permClass = Class.forName("com.chess.entities.GameAnalysisPermissions");
            Class<?> quotaTypeClass = Class.forName("com.chess.entities.GameAnalysisPermissions$QuotaType");
            Constructor<?> ctor = permClass.getConstructor(
                boolean.class, boolean.class, boolean.class, boolean.class, quotaTypeClass
            );
            return ctor.newInstance(true, true, true, true, null);
        } catch (Throwable t) {
            Log.e(TAG, "getFullGameAnalysisPermissions failed", t);
            return null;
        }
    }

    public static boolean getAnalysisPermission(boolean defaultValue, String permissionName) {
        return GameReview.local() || defaultValue;
    }

    /**
     * Whether a review item should fall back to a neutral "book" entry instead of the locally
     * synthesised one, because the app's own move converter cannot replay the suggested move
     * (chess.com's converter assumes server data with certain guarantees our local review
     * cannot always meet exactly). A review from chess.com's servers always keeps its own items.
     */
    public static boolean shouldUseDummyMove(Object positionObj, Object positionAndMoveObj) {
        if (!GameReview.local()) return false;
        if (positionObj == null) return true;
        try {
            Object playedMove = getPlayedMove(positionObj);
            if (playedMove == null) return true;

            Object suggestedMove = getSuggestedMove(positionObj);
            if (suggestedMove != null) {
                String moveStr = getSuggestedMoveString(suggestedMove);
                if (moveStr != null) {
                    Object position = getPositionFromPositionAndMove(positionAndMoveObj);
                    if (position != null) {
                        Object convertedMove = convertMove(position, moveStr);
                        if (convertedMove == null) {
                            Log.d(TAG, "Suggested move conversion failed for " + moveStr + "; using the dummy move");
                            return true;
                        }
                    }
                }
            }
        } catch (Throwable t) {
            Log.e(TAG, "shouldUseDummyMove failed, falling back to the dummy move", t);
            return true;
        }
        return false;
    }

    /**
     * Builds the neutral review item that replaces an un-renderable one: the played move marked
     * as a book move with a 0.00 score and no continuation. Constructed reflectively from the
     * result type's constructor, filling parameters by type.
     *
     * @param resultClass     the review item pair type supplied by the patch
     * @param positionAndMove the history entry for this ply
     */
    public static Object buildDummyMoveResult(Class<?> resultClass, Object positionAndMove) {
        try {
            Constructor<?> pairCtor = AppTypes.primaryCtor(resultClass);
            if (pairCtor == null || pairCtor.getParameterTypes().length == 0) return null;
            Class<?> moveInfoClass = pairCtor.getParameterTypes()[0];
            Constructor<?> infoCtor = AppTypes.primaryCtor(moveInfoClass);
            if (infoCtor == null) return null;

            Class<?> historyClass = Class.forName("com.chess.chessboard.history.i");
            Class<?> classificationClass = Class.forName("com.chess.compengine.AnalysisMoveClassification");
            Class<?> scoreClass = Class.forName("com.chess.entities.Score");
            Class<?> colorClass = Class.forName("com.chess.entities.Color");

            Object position = historyClass.getMethod("e").invoke(positionAndMove);
            Object side = position.getClass().getMethod("getSideToMove").invoke(position);
            Object companion = scoreClass.getField("Companion").get(null);
            Object score = companion.getClass()
                .getMethod("from", float.class, Integer.class, colorClass)
                .invoke(companion, 0f, null, side);
            Object book = null;
            for (Object c : classificationClass.getEnumConstants()) {
                if ("BOOK".equals(((Enum<?>) c).name())) { book = c; break; }
            }

            Class<?>[] p = infoCtor.getParameterTypes();
            Object[] args = new Object[p.length];
            boolean historyUsed = false;
            for (int i = 0; i < p.length; i++) {
                if (p[i] == historyClass && !historyUsed) { args[i] = positionAndMove; historyUsed = true; }
                else if (p[i] == classificationClass) args[i] = book;
                else if (p[i] == scoreClass) args[i] = score;
                else args[i] = AppTypes.defaultFor(p[i]);
            }
            Object info = infoCtor.newInstance(args);

            Object[] pairArgs = new Object[pairCtor.getParameterTypes().length];
            pairArgs[0] = info;
            for (int i = 1; i < pairArgs.length; i++) pairArgs[i] = AppTypes.defaultFor(pairCtor.getParameterTypes()[i]);
            return pairCtor.newInstance(pairArgs);
        } catch (Throwable t) {
            Log.e(TAG, "buildDummyMoveResult failed", t);
            return null;
        }
    }

    private static Object getPlayedMove(Object positionObj) {
        try {
            Class<?> pmClass = positionObj.getClass().getClassLoader().loadClass(positionObj.getClass().getName() + "$PlayedMove");
            for (Field f : positionObj.getClass().getDeclaredFields()) {
                if (f.getType().equals(pmClass)) {
                    f.setAccessible(true);
                    return f.get(positionObj);
                }
            }
        } catch (Throwable t) {
            Log.e(TAG, "Failed to get playedMove via reflection", t);
        }
        return null;
    }

    private static Object getSuggestedMove(Object positionObj) {
        try {
            Class<?> smClass = positionObj.getClass().getClassLoader().loadClass(positionObj.getClass().getName() + "$SuggestedMove");
            for (Field f : positionObj.getClass().getDeclaredFields()) {
                if (f.getType().equals(smClass)) {
                    f.setAccessible(true);
                    return f.get(positionObj);
                }
            }
        } catch (Throwable t) {
            Log.e(TAG, "Failed to get suggestedMove via reflection", t);
        }
        return null;
    }

    private static String getSuggestedMoveString(Object suggestedMoveObj) {
        try {
            for (Field f : suggestedMoveObj.getClass().getDeclaredFields()) {
                if (f.getType().equals(String.class)) {
                    f.setAccessible(true);
                    return (String) f.get(suggestedMoveObj);
                }
            }
        } catch (Throwable t) {
            Log.e(TAG, "Failed to get the suggested move string", t);
        }
        return null;
    }

    private static Object getPositionFromPositionAndMove(Object pmObj) {
        if (pmObj == null) return null;
        try {
            Class<?> dClass = Class.forName("com.chess.chessboard.variants.d");
            for (Field f : pmObj.getClass().getDeclaredFields()) {
                if (dClass.isAssignableFrom(f.getType())) {
                    f.setAccessible(true);
                    return f.get(pmObj);
                }
            }
        } catch (Throwable t) {
            Log.e(TAG, "Failed to get the position from PositionAndMove", t);
        }
        return null;
    }

    private static Object convertMove(Object position, String moveStr) {
        try {
            Class<?> converterClass = Class.forName("com.chess.chessboard.compengine.MoveConverterKt");
            Class<?> dClass = Class.forName("com.chess.chessboard.variants.d");
            Method convertMethod = converterClass.getMethod("d", dClass, String.class, boolean.class);
            return convertMethod.invoke(null, position, moveStr, true);
        } catch (Throwable t) {
            Log.e(TAG, "Failed to convert move", t);
            return null;
        }
    }
}
