.class public final synthetic Ll/po3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:Ll/zo3;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/zo3;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/po3;->a:Ll/zo3;

    iput-object p2, p0, Ll/po3;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/po3;->a:Ll/zo3;

    iget-object p0, p0, Ll/po3;->b:Ljava/lang/String;

    invoke-static {v0, p0}, Ll/zo3;->j(Ll/zo3;Ljava/lang/String;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
