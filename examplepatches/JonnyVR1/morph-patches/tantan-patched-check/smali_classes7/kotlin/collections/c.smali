.class public final synthetic Lkotlin/collections/c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:[F


# direct methods
.method public synthetic constructor <init>([F)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkotlin/collections/c;->a:[F

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lkotlin/collections/c;->a:[F

    invoke-static {p0}, Lkotlin/collections/ArraysKt___ArraysKt;->d([F)Ljava/util/Iterator;

    move-result-object p0

    return-object p0
.end method
