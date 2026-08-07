.class public final synthetic Ll/c7o;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/h7o;


# direct methods
.method public synthetic constructor <init>(Ll/h7o;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/c7o;->a:Ll/h7o;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/c7o;->a:Ll/h7o;

    check-cast p1, Ljava/lang/Integer;

    invoke-static {p0, p1}, Ll/h7o;->Y2(Ll/h7o;Ljava/lang/Integer;)V

    return-void
.end method
