.class public final synthetic Ll/ddi;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/pdi;


# direct methods
.method public synthetic constructor <init>(Ll/pdi;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ddi;->a:Ll/pdi;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ddi;->a:Ll/pdi;

    check-cast p1, Ljava/lang/Float;

    invoke-static {p0, p1}, Ll/pdi;->d(Ll/pdi;Ljava/lang/Float;)V

    return-void
.end method
