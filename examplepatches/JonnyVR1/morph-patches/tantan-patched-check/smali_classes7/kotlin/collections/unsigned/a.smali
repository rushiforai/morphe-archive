.class public final synthetic Lkotlin/collections/unsigned/a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:[I


# direct methods
.method public synthetic constructor <init>([I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkotlin/collections/unsigned/a;->a:[I

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lkotlin/collections/unsigned/a;->a:[I

    invoke-static {p0}, Lkotlin/collections/unsigned/UArraysKt___UArraysKt;->b([I)Ljava/util/Iterator;

    move-result-object p0

    return-object p0
.end method
