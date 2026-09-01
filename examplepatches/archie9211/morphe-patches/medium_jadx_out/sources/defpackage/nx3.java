package defpackage;

import android.text.InputFilter;
import android.text.method.PasswordTransformationMethod;
import android.text.method.TransformationMethod;
import android.util.SparseArray;
import android.widget.TextView;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class nx3 extends xz5 {
    public final TextView m;
    public final hx3 n;
    public boolean o = true;

    public nx3(TextView textView) {
        this.m = textView;
        this.n = new hx3(textView);
    }

    public final void G0() {
        TextView textView = this.m;
        TransformationMethod transformationMethod = textView.getTransformationMethod();
        if (this.o) {
            if (!(transformationMethod instanceof rx3) && !(transformationMethod instanceof PasswordTransformationMethod)) {
                transformationMethod = new rx3(transformationMethod);
            }
        } else if (transformationMethod instanceof rx3) {
            transformationMethod = ((rx3) transformationMethod).a;
        }
        textView.setTransformationMethod(transformationMethod);
    }

    @Override // defpackage.xz5
    public final InputFilter[] T(InputFilter[] inputFilterArr) {
        if (!this.o) {
            SparseArray sparseArray = new SparseArray(1);
            for (int i = 0; i < inputFilterArr.length; i++) {
                InputFilter inputFilter = inputFilterArr[i];
                if (inputFilter instanceof hx3) {
                    sparseArray.put(i, inputFilter);
                }
            }
            if (sparseArray.size() == 0) {
                return inputFilterArr;
            }
            int length = inputFilterArr.length;
            InputFilter[] inputFilterArr2 = new InputFilter[inputFilterArr.length - sparseArray.size()];
            int i2 = 0;
            for (int i3 = 0; i3 < length; i3++) {
                if (sparseArray.indexOfKey(i3) < 0) {
                    inputFilterArr2[i2] = inputFilterArr[i3];
                    i2++;
                }
            }
            return inputFilterArr2;
        }
        int length2 = inputFilterArr.length;
        int i4 = 0;
        while (true) {
            hx3 hx3Var = this.n;
            if (i4 >= length2) {
                InputFilter[] inputFilterArr3 = new InputFilter[inputFilterArr.length + 1];
                System.arraycopy(inputFilterArr, 0, inputFilterArr3, 0, length2);
                inputFilterArr3[length2] = hx3Var;
                return inputFilterArr3;
            }
            if (inputFilterArr[i4] == hx3Var) {
                return inputFilterArr;
            }
            i4++;
        }
    }

    @Override // defpackage.xz5
    public final void y0(boolean z) {
        if (z) {
            G0();
        }
    }

    @Override // defpackage.xz5
    public final void z0(boolean z) {
        this.o = z;
        G0();
        TextView textView = this.m;
        textView.setFilters(T(textView.getFilters()));
    }
}
