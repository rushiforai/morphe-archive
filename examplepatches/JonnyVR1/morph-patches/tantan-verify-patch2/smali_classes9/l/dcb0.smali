.class public final synthetic Ll/dcb0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Ljava/util/ArrayList;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ll/y20;

.field public final synthetic e:Ll/x20;

.field public final synthetic f:Ll/x20;

.field public final synthetic g:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;Ljava/lang/String;Ll/y20;Ll/x20;Ll/x20;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dcb0;->a:Lcom/p1/mobile/android/app/Act;

    iput-object p2, p0, Ll/dcb0;->b:Ljava/util/ArrayList;

    iput-object p3, p0, Ll/dcb0;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/dcb0;->d:Ll/y20;

    iput-object p5, p0, Ll/dcb0;->e:Ll/x20;

    iput-object p6, p0, Ll/dcb0;->f:Ll/x20;

    iput-object p7, p0, Ll/dcb0;->g:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 7

    .line 1
    iget-object v0, p0, Ll/dcb0;->a:Lcom/p1/mobile/android/app/Act;

    iget-object v1, p0, Ll/dcb0;->b:Ljava/util/ArrayList;

    iget-object v2, p0, Ll/dcb0;->c:Ljava/lang/String;

    iget-object v3, p0, Ll/dcb0;->d:Ll/y20;

    iget-object v4, p0, Ll/dcb0;->e:Ll/x20;

    iget-object v5, p0, Ll/dcb0;->f:Ll/x20;

    iget-object v6, p0, Ll/dcb0;->g:Ljava/lang/String;

    invoke-static/range {v0 .. v6}, Lcom/p1/mobile/putong/core/ui/purchase/c;->I(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;Ljava/lang/String;Ll/y20;Ll/x20;Ll/x20;Ljava/lang/String;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
