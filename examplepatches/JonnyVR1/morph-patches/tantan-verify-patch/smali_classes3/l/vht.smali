.class public final synthetic Ll/vht;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:[Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>([Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vht;->a:[Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vht;->a:[Ljava/lang/Object;

    check-cast p1, Ll/iit;

    invoke-static {p0, p1}, Ll/iit$a;->g([Ljava/lang/Object;Ll/iit;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
