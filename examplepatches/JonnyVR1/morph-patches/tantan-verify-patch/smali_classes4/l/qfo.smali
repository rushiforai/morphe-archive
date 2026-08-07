.class public final synthetic Ll/qfo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z20;


# instance fields
.field public final synthetic a:Ll/rfo;


# direct methods
.method public synthetic constructor <init>(Ll/rfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qfo;->a:Ll/rfo;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qfo;->a:Ll/rfo;

    check-cast p1, Ljava/lang/Integer;

    check-cast p2, Ljava/lang/Boolean;

    invoke-static {p0, p1, p2}, Ll/rfo;->b(Ll/rfo;Ljava/lang/Integer;Ljava/lang/Boolean;)V

    return-void
.end method
