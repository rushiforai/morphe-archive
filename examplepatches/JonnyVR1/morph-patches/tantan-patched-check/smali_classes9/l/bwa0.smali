.class public final synthetic Ll/bwa0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ewa0;


# direct methods
.method public synthetic constructor <init>(Ll/ewa0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bwa0;->a:Ll/ewa0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bwa0;->a:Ll/ewa0;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {p0, p1}, Ll/ewa0;->T(Ll/ewa0;Ljava/lang/Throwable;)V

    return-void
.end method
