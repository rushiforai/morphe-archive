.class public final synthetic Ll/q4x;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/material/tabs/TabLayoutMediator$TabConfigurationStrategy;


# instance fields
.field public final synthetic a:Ll/u4x;

.field public final synthetic b:[Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/u4x;[Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/q4x;->a:Ll/u4x;

    iput-object p2, p0, Ll/q4x;->b:[Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final onConfigureTab(Lcom/google/android/material/tabs/TabLayout$Tab;I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/q4x;->a:Ll/u4x;

    iget-object p0, p0, Ll/q4x;->b:[Ljava/lang/String;

    invoke-static {v0, p0, p1, p2}, Ll/u4x;->a(Ll/u4x;[Ljava/lang/String;Lcom/google/android/material/tabs/TabLayout$Tab;I)V

    return-void
.end method
