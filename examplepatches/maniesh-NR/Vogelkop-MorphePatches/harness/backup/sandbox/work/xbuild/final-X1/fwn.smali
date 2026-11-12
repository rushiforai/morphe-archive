.class public final Lfwn;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lo28;

.field public final b:Lovn;

.field public c:Lwub;


# direct methods
.method public constructor <init>()V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lo28;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Lo28;-><init>(B)V

    iput-object v0, p0, Lfwn;->a:Lo28;

    new-instance v0, Lovn;

    invoke-direct {v0}, Lovn;-><init>()V

    iput-object v0, p0, Lfwn;->b:Lovn;

    return-void
.end method
