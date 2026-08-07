.class public final synthetic Ll/ro3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:Ll/zo3;


# direct methods
.method public synthetic constructor <init>(Ll/zo3;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ro3;->a:Ll/zo3;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ro3;->a:Ll/zo3;

    invoke-static {p0}, Ll/zo3;->m(Ll/zo3;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
