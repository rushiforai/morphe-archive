.class public final synthetic Ll/r6z;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/clz;


# direct methods
.method public synthetic constructor <init>(Ll/clz;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/r6z;->a:Ll/clz;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/r6z;->a:Ll/clz;

    check-cast p1, Ljava/lang/String;

    invoke-static {p0, p1}, Ll/nbz;->d1(Ll/clz;Ljava/lang/String;)V

    return-void
.end method
