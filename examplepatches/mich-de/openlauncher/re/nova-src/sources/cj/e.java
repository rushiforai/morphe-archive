package cj;

import android.animation.Animator;
import android.animation.AnimatorInflater;
import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.animation.TimeInterpolator;
import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.util.Log;
import android.view.animation.AccelerateDecelerateInterpolator;
import android.view.animation.AccelerateInterpolator;
import android.view.animation.DecelerateInterpolator;
import java.util.ArrayList;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import z.c1;

/* loaded from: classes3.dex */
public final class e {

    /* renamed from: a, reason: collision with root package name */
    public final c1 f19959a = new c1(0);

    /* renamed from: b, reason: collision with root package name */
    public final c1 f19960b = new c1(0);

    public static e a(Context context, TypedArray typedArray, int i5) {
        int resourceId;
        if (!typedArray.hasValue(i5) || (resourceId = typedArray.getResourceId(i5, 0)) == 0) {
            return null;
        }
        return b(context, resourceId);
    }

    public static e b(Context context, int i5) throws Resources.NotFoundException {
        try {
            Animator animatorLoadAnimator = AnimatorInflater.loadAnimator(context, i5);
            if (animatorLoadAnimator instanceof AnimatorSet) {
                return c(((AnimatorSet) animatorLoadAnimator).getChildAnimations());
            }
            if (animatorLoadAnimator == null) {
                return null;
            }
            ArrayList arrayList = new ArrayList();
            arrayList.add(animatorLoadAnimator);
            return c(arrayList);
        } catch (Exception e3) {
            Log.w("MotionSpec", "Can't load animation resource ID #0x" + Integer.toHexString(i5), e3);
            return null;
        }
    }

    public static e c(ArrayList arrayList) {
        e eVar = new e();
        int size = arrayList.size();
        for (int i5 = 0; i5 < size; i5++) {
            Animator animator = (Animator) arrayList.get(i5);
            if (!(animator instanceof ObjectAnimator)) {
                throw new IllegalArgumentException("Animator must be an ObjectAnimator: " + animator);
            }
            ObjectAnimator objectAnimator = (ObjectAnimator) animator;
            eVar.f19960b.put(objectAnimator.getPropertyName(), objectAnimator.getValues());
            String propertyName = objectAnimator.getPropertyName();
            long startDelay = objectAnimator.getStartDelay();
            long duration = objectAnimator.getDuration();
            TimeInterpolator interpolator = objectAnimator.getInterpolator();
            if ((interpolator instanceof AccelerateDecelerateInterpolator) || interpolator == null) {
                interpolator = a.f19952b;
            } else if (interpolator instanceof AccelerateInterpolator) {
                interpolator = a.f19953c;
            } else if (interpolator instanceof DecelerateInterpolator) {
                interpolator = a.f19954d;
            }
            f fVar = new f();
            fVar.f19964d = 0;
            fVar.f19965e = 1;
            fVar.f19961a = startDelay;
            fVar.f19962b = duration;
            fVar.f19963c = interpolator;
            fVar.f19964d = objectAnimator.getRepeatCount();
            fVar.f19965e = objectAnimator.getRepeatMode();
            eVar.f19959a.put(propertyName, fVar);
        }
        return eVar;
    }

    public final f d(String str) {
        c1 c1Var = this.f19959a;
        if (c1Var.get(str) != null) {
            return (f) c1Var.get(str);
        }
        throw new IllegalArgumentException();
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof e) {
            return this.f19959a.equals(((e) obj).f19959a);
        }
        return false;
    }

    public final int hashCode() {
        return this.f19959a.hashCode();
    }

    public final String toString() {
        return "\n" + e.class.getName() + AbstractJsonLexerKt.BEGIN_OBJ + Integer.toHexString(System.identityHashCode(this)) + " timings: " + this.f19959a + "}\n";
    }
}
