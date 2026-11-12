.class public final synthetic Lvc1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/webkit/ValueCallback;


# instance fields
.field public final synthetic a:Lq0n;


# direct methods
.method public synthetic constructor <init>(Lq0n;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lvc1;->a:Lq0n;

    return-void
.end method


# virtual methods
.method public final onReceiveValue(Ljava/lang/Object;)V
    .registers 2

    iget-object p0, p0, Lvc1;->a:Lq0n;

    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lq0n;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method
