.class public final synthetic Ll/me1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;

.field public final synthetic b:J

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;JZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/me1;->a:Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;

    iput-wide p2, p0, Ll/me1;->b:J

    iput-boolean p4, p0, Ll/me1;->c:Z

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/me1;->a:Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;

    iget-wide v1, p0, Ll/me1;->b:J

    iget-boolean p0, p0, Ll/me1;->c:Z

    invoke-static {v0, v1, v2, p0}, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->V3(Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;JZ)V

    return-void
.end method
