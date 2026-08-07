.class public final synthetic Ll/ls30;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/material/tabs/TabLayoutMediator$TabConfigurationStrategy;


# instance fields
.field public final synthetic a:Ll/ms30;


# direct methods
.method public synthetic constructor <init>(Ll/ms30;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ls30;->a:Ll/ms30;

    return-void
.end method


# virtual methods
.method public final onConfigureTab(Lcom/google/android/material/tabs/TabLayout$Tab;I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ls30;->a:Ll/ms30;

    invoke-static {p0, p1, p2}, Ll/ms30;->a(Ll/ms30;Lcom/google/android/material/tabs/TabLayout$Tab;I)V

    return-void
.end method
