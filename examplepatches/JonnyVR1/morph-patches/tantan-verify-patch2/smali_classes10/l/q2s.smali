.class public final synthetic Ll/q2s;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z20;


# instance fields
.field public final synthetic a:Ll/r2s;


# direct methods
.method public synthetic constructor <init>(Ll/r2s;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/q2s;->a:Ll/r2s;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q2s;->a:Ll/r2s;

    check-cast p1, Ljava/lang/Integer;

    invoke-static {p0, p1, p2}, Ll/r2s;->r4(Ll/r2s;Ljava/lang/Integer;Ljava/lang/Object;)V

    return-void
.end method
