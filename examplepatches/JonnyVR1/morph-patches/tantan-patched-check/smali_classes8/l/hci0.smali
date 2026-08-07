.class public final synthetic Ll/hci0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/xc00;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/xc00;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hci0;->a:Ll/xc00;

    iput-object p2, p0, Ll/hci0;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hci0;->a:Ll/xc00;

    iget-object p0, p0, Ll/hci0;->b:Ljava/lang/String;

    check-cast p1, Ll/vg60;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;->S(Ll/xc00;Ljava/lang/String;Ll/vg60;)V

    return-void
.end method
