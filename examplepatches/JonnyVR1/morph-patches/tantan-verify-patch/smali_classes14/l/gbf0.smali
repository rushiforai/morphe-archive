.class public final synthetic Ll/gbf0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/ibf0;

.field public final synthetic b:Lcom/p1/mobile/putong/data/SignInData;

.field public final synthetic c:Ljava/lang/Runnable;

.field public final synthetic d:Ll/y20;

.field public final synthetic e:Ljava/lang/Throwable;


# direct methods
.method public synthetic constructor <init>(Ll/ibf0;Lcom/p1/mobile/putong/data/SignInData;Ljava/lang/Runnable;Ll/y20;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gbf0;->a:Ll/ibf0;

    iput-object p2, p0, Ll/gbf0;->b:Lcom/p1/mobile/putong/data/SignInData;

    iput-object p3, p0, Ll/gbf0;->c:Ljava/lang/Runnable;

    iput-object p4, p0, Ll/gbf0;->d:Ll/y20;

    iput-object p5, p0, Ll/gbf0;->e:Ljava/lang/Throwable;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/gbf0;->a:Ll/ibf0;

    iget-object v1, p0, Ll/gbf0;->b:Lcom/p1/mobile/putong/data/SignInData;

    iget-object v2, p0, Ll/gbf0;->c:Ljava/lang/Runnable;

    iget-object v3, p0, Ll/gbf0;->d:Ll/y20;

    iget-object p0, p0, Ll/gbf0;->e:Ljava/lang/Throwable;

    invoke-static {v0, v1, v2, v3, p0}, Ll/ibf0;->p0(Ll/ibf0;Lcom/p1/mobile/putong/data/SignInData;Ljava/lang/Runnable;Ll/y20;Ljava/lang/Throwable;)V

    return-void
.end method
