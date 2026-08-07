.class public final synthetic Ll/asf0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Ljava/lang/String;

.field public final synthetic f:Ll/aqq;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/aqq;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/asf0;->a:Ljava/lang/String;

    iput-object p2, p0, Ll/asf0;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/asf0;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/asf0;->d:Ljava/lang/String;

    iput-object p5, p0, Ll/asf0;->e:Ljava/lang/String;

    iput-object p6, p0, Ll/asf0;->f:Ll/aqq;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/asf0;->a:Ljava/lang/String;

    iget-object v1, p0, Ll/asf0;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/asf0;->c:Ljava/lang/String;

    iget-object v3, p0, Ll/asf0;->d:Ljava/lang/String;

    iget-object v4, p0, Ll/asf0;->e:Ljava/lang/String;

    iget-object v5, p0, Ll/asf0;->f:Ll/aqq;

    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/ui/jsbridge/implement/SliderBridgeImplementation;->f(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/aqq;)V

    return-void
.end method
