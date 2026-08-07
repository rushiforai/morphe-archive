.class public final synthetic Ll/ycb0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ll/y20;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ycb0;->a:Lcom/p1/mobile/android/app/Act;

    iput-object p2, p0, Ll/ycb0;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/ycb0;->c:Ll/y20;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ycb0;->a:Lcom/p1/mobile/android/app/Act;

    iget-object v1, p0, Ll/ycb0;->b:Ljava/lang/String;

    iget-object p0, p0, Ll/ycb0;->c:Ll/y20;

    check-cast p1, Ljava/util/List;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/c;->q(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/y20;Ljava/util/List;)V

    return-void
.end method
