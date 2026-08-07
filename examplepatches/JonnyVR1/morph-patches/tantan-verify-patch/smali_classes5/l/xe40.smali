.class public final synthetic Ll/xe40;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/if40;


# direct methods
.method public synthetic constructor <init>(Ll/if40;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xe40;->a:Ll/if40;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xe40;->a:Ll/if40;

    check-cast p1, Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;

    invoke-static {p0, p1}, Ll/if40;->i0(Ll/if40;Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;)V

    return-void
.end method
