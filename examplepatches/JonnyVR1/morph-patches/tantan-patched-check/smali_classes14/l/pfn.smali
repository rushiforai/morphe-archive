.class public final synthetic Ll/pfn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/sfn;


# direct methods
.method public synthetic constructor <init>(Ll/sfn;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pfn;->a:Ll/sfn;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pfn;->a:Ll/sfn;

    check-cast p1, Ljava/lang/String;

    invoke-static {p0, p1}, Ll/sfn;->g0(Ll/sfn;Ljava/lang/String;)V

    return-void
.end method
