.class public final synthetic Ll/ida;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Z


# direct methods
.method public synthetic constructor <init>(Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Ll/ida;->a:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/ida;->a:Z

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {p0, p1}, Ll/jka;->m4(ZLjava/lang/Throwable;)V

    return-void
.end method
