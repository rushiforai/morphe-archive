.class public final synthetic Ll/tsb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lv/CoverGuideView;


# direct methods
.method public synthetic constructor <init>(Lv/CoverGuideView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tsb;->a:Lv/CoverGuideView;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tsb;->a:Lv/CoverGuideView;

    invoke-static {p0}, Lv/CoverGuideView;->a(Lv/CoverGuideView;)V

    return-void
.end method
