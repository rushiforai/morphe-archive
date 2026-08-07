.class public final Ll/j8t0;
.super Ll/h7t0;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:I


# direct methods
.method public constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/h7t0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/j8t0;->a:Ljava/lang/String;

    .line 5
    .line 6
    iput p2, p0, Ll/j8t0;->b:I

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final zze()I
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1
    iget p0, p0, Ll/j8t0;->b:I

    .line 2
    .line 3
    return p0
.end method

.method public final zzf()Ljava/lang/String;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/j8t0;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
