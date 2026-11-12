/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-09.
 */
package app.morphe.extension.music.patches.downloads;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;

import org.junit.Test;

import java.util.List;
import java.util.Set;

public class ResponseFieldsTest {
    private static final byte[] PLAYABILITY = {1, 2, 3};
    private static final byte[] DETAILS_LIVE = {4, 5};
    private static final byte[] DETAILS_OWN = {6};

    private static byte[] online() {
        return new ProtoWriter().message(1, new byte[]{9, 9, 9}).message(2, PLAYABILITY)
                .message(4, new byte[]{8}).message(7, new byte[]{7, 7}).message(11, DETAILS_LIVE)
                .int64(16, 503).message(71, new byte[]{1}).toByteArray();
    }

    @Test public void fieldsAreRemovedWholeAndTheRestIsCopiedByteForByte() throws Exception {
        byte[] result = ResponseFields.without(online(), Set.of(4, 7));

        assertEquals(List.of(1, 2, 11, 16, 71), ProtoFields.numbers(result));
        assertArrayEquals(PLAYABILITY, ProtoFields.one(result, 2));
        assertEquals(503, ProtoFields.varint(result, 16));
    }

    @Test public void theOnlineShapeKeepsEveryOnlineFieldButTheCopysOwn() throws Exception {
        byte[] stored = new ProtoWriter().message(2, new byte[]{0}).message(4, new byte[]{1, 1, 1})
                .message(11, DETAILS_OWN).message(14, new byte[]{3}).toByteArray();

        byte[] answer = ResponseFields.baseWithOwn(online(), stored, Set.of(4, 11));

        assertEquals(List.of(1, 2, 7, 16, 71, 4, 11, 14), ProtoFields.numbers(answer));
        assertArrayEquals(PLAYABILITY, ProtoFields.one(answer, 2));
        assertArrayEquals(new byte[]{1, 1, 1}, ProtoFields.one(answer, 4));
        assertArrayEquals(DETAILS_OWN, ProtoFields.one(answer, 11));
        assertEquals(1, ProtoFields.all(answer, 11).size());
        assertEquals(1, ProtoFields.all(answer, 2).size());
    }

    @Test public void anOwnFieldTheStoredResponseLacksStaysAsTheOnlineResponseHasIt() throws Exception {
        byte[] answer = ResponseFields.baseWithOwn(online(), new ProtoWriter().message(14, new byte[]{3})
                .toByteArray(), Set.of(4, 11));

        assertEquals(List.of(1, 2, 4, 7, 11, 16, 71, 14), ProtoFields.numbers(answer));
        assertArrayEquals(DETAILS_LIVE, ProtoFields.one(answer, 11));
    }
}
