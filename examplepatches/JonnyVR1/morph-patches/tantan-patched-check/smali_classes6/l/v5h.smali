.class public final synthetic Ll/v5h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/material/appbar/AppBarLayout$OnOffsetChangedListener;


# instance fields
.field public final synthetic a:Ll/c6h;


# direct methods
.method public synthetic constructor <init>(Ll/c6h;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/v5h;->a:Ll/c6h;

    return-void
.end method


# virtual methods
.method public final onOffsetChanged(Lcom/google/android/material/appbar/AppBarLayout;I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/v5h;->a:Ll/c6h;

    invoke-static {p0, p1, p2}, Ll/c6h;->g(Ll/c6h;Lcom/google/android/material/appbar/AppBarLayout;I)V

    return-void
.end method
