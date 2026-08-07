.class public final synthetic Ll/j1r0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/tencent/could/huiyansdk/fragments/f;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Lcom/tencent/could/huiyansdk/fragments/f;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/j1r0;->a:Lcom/tencent/could/huiyansdk/fragments/f;

    iput p2, p0, Ll/j1r0;->b:I

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/j1r0;->a:Lcom/tencent/could/huiyansdk/fragments/f;

    iget p0, p0, Ll/j1r0;->b:I

    invoke-static {v0, p0}, Lcom/tencent/could/huiyansdk/fragments/f;->a(Lcom/tencent/could/huiyansdk/fragments/f;I)V

    return-void
.end method
