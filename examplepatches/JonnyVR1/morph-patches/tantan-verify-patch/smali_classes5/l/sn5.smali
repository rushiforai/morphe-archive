.class public final synthetic Ll/sn5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/tencent/could/huiyansdk/fragments/BaseFragment;


# direct methods
.method public synthetic constructor <init>(Lcom/tencent/could/huiyansdk/fragments/BaseFragment;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/sn5;->a:Lcom/tencent/could/huiyansdk/fragments/BaseFragment;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sn5;->a:Lcom/tencent/could/huiyansdk/fragments/BaseFragment;

    invoke-static {p0}, Lcom/tencent/could/huiyansdk/utils/CommonUtils;->b(Lcom/tencent/could/huiyansdk/fragments/BaseFragment;)V

    return-void
.end method
