.class public final synthetic Ll/dzd0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Ljava/lang/String;

.field public final synthetic f:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dzd0;->a:Ljava/lang/String;

    iput-object p2, p0, Ll/dzd0;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/dzd0;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/dzd0;->d:Ljava/lang/String;

    iput-object p5, p0, Ll/dzd0;->e:Ljava/lang/String;

    iput-object p6, p0, Ll/dzd0;->f:Ll/x20;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 7

    .line 1
    iget-object v0, p0, Ll/dzd0;->a:Ljava/lang/String;

    iget-object v1, p0, Ll/dzd0;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/dzd0;->c:Ljava/lang/String;

    iget-object v3, p0, Ll/dzd0;->d:Ljava/lang/String;

    iget-object v4, p0, Ll/dzd0;->e:Ljava/lang/String;

    iget-object v5, p0, Ll/dzd0;->f:Ll/x20;

    move-object v6, p1

    check-cast v6, Landroid/view/View;

    invoke-static/range {v0 .. v6}, Lcom/p1/mobile/putong/live/livingroom/view/SayHiBubbleView;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/x20;Landroid/view/View;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
