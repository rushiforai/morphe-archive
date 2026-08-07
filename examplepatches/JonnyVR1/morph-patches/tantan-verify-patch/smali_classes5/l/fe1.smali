.class public final synthetic Ll/fe1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;

.field public final synthetic b:Lcom/tencent/could/huiyansdk/entity/CompareResult;


# direct methods
.method public synthetic constructor <init>(Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;Lcom/tencent/could/huiyansdk/entity/CompareResult;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fe1;->a:Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;

    iput-object p2, p0, Ll/fe1;->b:Lcom/tencent/could/huiyansdk/entity/CompareResult;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/fe1;->a:Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;

    iget-object p0, p0, Ll/fe1;->b:Lcom/tencent/could/huiyansdk/entity/CompareResult;

    invoke-static {v0, p0}, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->g4(Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;Lcom/tencent/could/huiyansdk/entity/CompareResult;)V

    return-void
.end method
