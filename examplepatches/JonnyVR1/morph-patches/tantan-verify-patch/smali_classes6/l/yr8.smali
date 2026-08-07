.class public final synthetic Ll/yr8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/ms8;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ll/y20;


# direct methods
.method public synthetic constructor <init>(Ll/ms8;Ljava/lang/String;Ll/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yr8;->a:Ll/ms8;

    iput-object p2, p0, Ll/yr8;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/yr8;->c:Ll/y20;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/yr8;->a:Ll/ms8;

    iget-object v1, p0, Ll/yr8;->b:Ljava/lang/String;

    iget-object p0, p0, Ll/yr8;->c:Ll/y20;

    check-cast p1, Lcom/p1/mobile/putong/data/BubbleInfo;

    invoke-static {v0, v1, p0, p1}, Ll/ms8;->F0(Ll/ms8;Ljava/lang/String;Ll/y20;Lcom/p1/mobile/putong/data/BubbleInfo;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
