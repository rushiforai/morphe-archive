.class public final synthetic Ll/xes;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/yes;


# direct methods
.method public synthetic constructor <init>(Ll/yes;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xes;->a:Ll/yes;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xes;->a:Ll/yes;

    check-cast p1, Lcom/google/android/gms/ads/AdView;

    invoke-static {p0, p1}, Ll/yes;->k(Ll/yes;Lcom/google/android/gms/ads/AdView;)Lcom/google/android/gms/ads/AdView;

    move-result-object p0

    return-object p0
.end method
