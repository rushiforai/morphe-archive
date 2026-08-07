.class public final synthetic Ll/azg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/b0h0;


# instance fields
.field public final synthetic a:Ltech/sud/gip/core/ISudListenerNotifyStateChange;


# direct methods
.method public synthetic constructor <init>(Ltech/sud/gip/core/ISudListenerNotifyStateChange;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/azg0;->a:Ltech/sud/gip/core/ISudListenerNotifyStateChange;

    return-void
.end method


# virtual methods
.method public final a(Lorg/json/JSONArray;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/azg0;->a:Ltech/sud/gip/core/ISudListenerNotifyStateChange;

    invoke-static {p0, p1}, Ll/mzg0;->d(Ltech/sud/gip/core/ISudListenerNotifyStateChange;Lorg/json/JSONArray;)V

    return-void
.end method
