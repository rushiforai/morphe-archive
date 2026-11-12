.class public final synthetic La9e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lzak;


# instance fields
.field public final synthetic a:Lu85;


# direct methods
.method public synthetic constructor <init>(Lu85;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, La9e;->a:Lu85;

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Object;)V
    .registers 2

    iget-object p0, p0, La9e;->a:Lu85;

    check-cast p1, Lqop;

    invoke-virtual {p0, p1}, Lu85;->h(Lqop;)V

    return-void
.end method
