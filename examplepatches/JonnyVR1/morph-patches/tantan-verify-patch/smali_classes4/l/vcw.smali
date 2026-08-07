.class public final synthetic Ll/vcw;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;

.field public final synthetic b:F

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;FI)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vcw;->a:Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;

    iput p2, p0, Ll/vcw;->b:F

    iput p3, p0, Ll/vcw;->c:I

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/vcw;->a:Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;

    iget v1, p0, Ll/vcw;->b:F

    iget p0, p0, Ll/vcw;->c:I

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;->a(Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;FI)V

    return-void
.end method
