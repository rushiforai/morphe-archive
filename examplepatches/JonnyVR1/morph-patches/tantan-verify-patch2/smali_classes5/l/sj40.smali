.class public final synthetic Ll/sj40;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ozk0;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/sj40;->a:Lcom/p1/mobile/android/app/Act;

    return-void
.end method


# virtual methods
.method public final a(F)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sj40;->a:Lcom/p1/mobile/android/app/Act;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUIAbFilterBaseSetting;->V(Lcom/p1/mobile/android/app/Act;F)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
