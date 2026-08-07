.class public final synthetic Ll/gn20;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/hn20;


# direct methods
.method public synthetic constructor <init>(Ll/hn20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gn20;->a:Ll/hn20;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gn20;->a:Ll/hn20;

    check-cast p1, Lcom/p1/mobile/putong/core/data/AdvancedSettings;

    invoke-static {p0, p1}, Ll/hn20;->i0(Ll/hn20;Lcom/p1/mobile/putong/core/data/AdvancedSettings;)V

    return-void
.end method
