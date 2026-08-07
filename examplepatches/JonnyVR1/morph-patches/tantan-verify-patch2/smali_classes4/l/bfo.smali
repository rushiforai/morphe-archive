.class public final synthetic Ll/bfo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/material/tabs/TabLayoutMediator$TabConfigurationStrategy;


# instance fields
.field public final synthetic a:Ll/cfo;


# direct methods
.method public synthetic constructor <init>(Ll/cfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bfo;->a:Ll/cfo;

    return-void
.end method


# virtual methods
.method public final onConfigureTab(Lcom/google/android/material/tabs/TabLayout$Tab;I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bfo;->a:Ll/cfo;

    invoke-static {p0, p1, p2}, Ll/cfo;->b(Ll/cfo;Lcom/google/android/material/tabs/TabLayout$Tab;I)V

    return-void
.end method
