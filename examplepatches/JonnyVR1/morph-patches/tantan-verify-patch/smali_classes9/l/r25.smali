.class public final synthetic Ll/r25;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/rcj;


# instance fields
.field public final synthetic a:Ll/w25;


# direct methods
.method public synthetic constructor <init>(Ll/w25;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/r25;->a:Ll/w25;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/r25;->a:Ll/w25;

    check-cast p1, Ll/fyb;

    check-cast p2, Ljava/lang/Float;

    invoke-static {p0, p1, p2}, Ll/w25;->N3(Ll/w25;Ll/fyb;Ljava/lang/Float;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
