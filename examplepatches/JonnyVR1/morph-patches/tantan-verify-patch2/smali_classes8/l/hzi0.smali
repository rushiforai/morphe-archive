.class public final synthetic Ll/hzi0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lv/TickerView;


# direct methods
.method public synthetic constructor <init>(Lv/TickerView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hzi0;->a:Lv/TickerView;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hzi0;->a:Lv/TickerView;

    check-cast p1, [I

    invoke-static {p0, p1}, Lv/TickerView;->c(Lv/TickerView;[I)V

    return-void
.end method
