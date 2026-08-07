.class public final synthetic Ll/bs30;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/material/tabs/TabLayoutMediator$TabConfigurationStrategy;


# instance fields
.field public final synthetic a:Ll/cs30;


# direct methods
.method public synthetic constructor <init>(Ll/cs30;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bs30;->a:Ll/cs30;

    return-void
.end method


# virtual methods
.method public final onConfigureTab(Lcom/google/android/material/tabs/TabLayout$Tab;I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bs30;->a:Ll/cs30;

    invoke-static {p0, p1, p2}, Ll/cs30;->b(Ll/cs30;Lcom/google/android/material/tabs/TabLayout$Tab;I)V

    return-void
.end method
