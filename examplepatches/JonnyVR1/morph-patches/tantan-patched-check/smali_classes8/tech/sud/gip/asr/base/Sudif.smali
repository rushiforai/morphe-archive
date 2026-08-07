.class public final Ltech/sud/gip/asr/base/Sudif;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ltech/sud/gip/asr/base/Sudnew;


# instance fields
.field public final Suddo:Ljava/lang/String;

.field public final Sudif:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-class v0, Ltech/sud/gip/asr/base/Sudif;

    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    const-string v1, "SudGIP "

    .line 11
    .line 12
    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iput-object v0, p0, Ltech/sud/gip/asr/base/Sudif;->Suddo:Ljava/lang/String;

    .line 17
    .line 18
    iput-object p1, p0, Ltech/sud/gip/asr/base/Sudif;->Sudif:Ljava/lang/String;

    .line 19
    .line 20
    return-void
.end method
