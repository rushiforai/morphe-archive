package com.drew.metadata;

import sprig.b.VPIE.dpBiLjNeNsiASg;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public class Face {
    private final Age _age;
    private final int _height;
    private final String _name;
    private final int _width;
    private final int _x;
    private final int _y;

    public Face(int i, int i2, int i3, int i4, String str, Age age) {
        this._x = i;
        this._y = i2;
        this._width = i3;
        this._height = i4;
        this._name = str;
        this._age = age;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        Face face = (Face) obj;
        if (this._height != face._height || this._width != face._width || this._x != face._x || this._y != face._y) {
            return false;
        }
        Age age = this._age;
        Age age2 = face._age;
        if (age == null ? age2 != null : !age.equals(age2)) {
            return false;
        }
        String str = this._name;
        String str2 = face._name;
        return str == null ? str2 == null : str.equals(str2);
    }

    public final Age getAge() {
        return this._age;
    }

    public final int getHeight() {
        return this._height;
    }

    public final String getName() {
        return this._name;
    }

    public final int getWidth() {
        return this._width;
    }

    public final int getX() {
        return this._x;
    }

    public final int getY() {
        return this._y;
    }

    public final int hashCode() {
        int i = ((((((this._x * 31) + this._y) * 31) + this._width) * 31) + this._height) * 31;
        String str = this._name;
        int iHashCode = (i + (str != null ? str.hashCode() : 0)) * 31;
        Age age = this._age;
        return iHashCode + (age != null ? age.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder(dpBiLjNeNsiASg.HPtWnfJvWk);
        sb.append(this._x);
        sb.append(" y: ");
        sb.append(this._y);
        sb.append(" width: ");
        sb.append(this._width);
        sb.append(" height: ");
        sb.append(this._height);
        if (this._name != null) {
            sb.append(" name: ");
            sb.append(this._name);
        }
        if (this._age != null) {
            sb.append(" age: ");
            sb.append(this._age.toFriendlyString());
        }
        return sb.toString();
    }
}
