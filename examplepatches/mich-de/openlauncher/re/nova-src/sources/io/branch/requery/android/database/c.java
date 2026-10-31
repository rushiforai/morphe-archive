package io.branch.requery.android.database;

import android.database.CharArrayBuffer;
import android.database.CursorIndexOutOfBoundsException;
import android.database.StaleDataException;

/* loaded from: classes4.dex */
public abstract class c extends b {
    protected CursorWindow mWindow;

    public void checkPosition() {
        if (-1 == this.mPos || getCount() == this.mPos) {
            throw new CursorIndexOutOfBoundsException(this.mPos, getCount());
        }
        if (this.mWindow == null) {
            throw new StaleDataException("Attempting to access a closed CursorWindow.Most probable cause: cursor is deactivated prior to calling this method.");
        }
    }

    public void clearOrCreateWindow(String str) {
        CursorWindow cursorWindow = this.mWindow;
        if (cursorWindow == null) {
            this.mWindow = new CursorWindow(str);
        } else {
            cursorWindow.clear();
        }
    }

    public void closeWindow() {
        CursorWindow cursorWindow = this.mWindow;
        if (cursorWindow != null) {
            cursorWindow.close();
            this.mWindow = null;
        }
    }

    @Override // android.database.Cursor
    public void copyStringToBuffer(int i5, CharArrayBuffer charArrayBuffer) {
        this.mWindow.copyStringToBuffer(this.mPos, i5, charArrayBuffer);
    }

    @Override // android.database.Cursor
    public byte[] getBlob(int i5) {
        checkPosition();
        return this.mWindow.getBlob(this.mPos, i5);
    }

    @Override // android.database.Cursor
    public double getDouble(int i5) {
        checkPosition();
        return this.mWindow.getDouble(this.mPos, i5);
    }

    @Override // android.database.Cursor
    public float getFloat(int i5) {
        checkPosition();
        return this.mWindow.getFloat(this.mPos, i5);
    }

    @Override // android.database.Cursor
    public int getInt(int i5) {
        checkPosition();
        return this.mWindow.getInt(this.mPos, i5);
    }

    @Override // android.database.Cursor
    public long getLong(int i5) {
        checkPosition();
        return this.mWindow.getLong(this.mPos, i5);
    }

    @Override // android.database.Cursor
    public short getShort(int i5) {
        checkPosition();
        return this.mWindow.getShort(this.mPos, i5);
    }

    @Override // android.database.Cursor
    public String getString(int i5) {
        checkPosition();
        return this.mWindow.getString(this.mPos, i5);
    }

    @Override // android.database.Cursor
    public int getType(int i5) {
        return this.mWindow.getType(this.mPos, i5);
    }

    public CursorWindow getWindow() {
        return this.mWindow;
    }

    public boolean hasWindow() {
        return this.mWindow != null;
    }

    @Override // android.database.Cursor
    public boolean isNull(int i5) {
        return this.mWindow.getType(this.mPos, i5) == 0;
    }

    @Override // io.branch.requery.android.database.b
    public void onDeactivateOrClose() {
        super.onDeactivateOrClose();
        closeWindow();
    }

    public void setWindow(CursorWindow cursorWindow) {
        if (cursorWindow != this.mWindow) {
            closeWindow();
            this.mWindow = cursorWindow;
        }
    }
}
