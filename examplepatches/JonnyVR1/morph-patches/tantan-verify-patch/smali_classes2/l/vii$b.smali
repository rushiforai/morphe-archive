.class public Ll/vii$b;
.super Ll/vii$a;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/vii;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/vii$a<",
        "Landroid/os/ParcelFileDescriptor;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    new-instance v0, Ll/vii$b$a;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/vii$b$a;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0}, Ll/vii$a;-><init>(Ll/vii$d;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
