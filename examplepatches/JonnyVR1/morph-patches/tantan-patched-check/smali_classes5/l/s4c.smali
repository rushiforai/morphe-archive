.class public final synthetic Ll/s4c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/z4c;


# direct methods
.method public synthetic constructor <init>(Ll/z4c;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/s4c;->a:Ll/z4c;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s4c;->a:Ll/z4c;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {p0, p1}, Ll/z4c;->i0(Ll/z4c;Ljava/lang/Throwable;)V

    return-void
.end method
