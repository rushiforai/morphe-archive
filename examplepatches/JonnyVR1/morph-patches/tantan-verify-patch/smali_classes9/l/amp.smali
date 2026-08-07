.class public final synthetic Ll/amp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/bmp;


# direct methods
.method public synthetic constructor <init>(Ll/bmp;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/amp;->a:Ll/bmp;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/amp;->a:Ll/bmp;

    check-cast p1, Ljava/lang/Integer;

    invoke-static {p0, p1}, Ll/bmp;->a(Ll/bmp;Ljava/lang/Integer;)V

    return-void
.end method
