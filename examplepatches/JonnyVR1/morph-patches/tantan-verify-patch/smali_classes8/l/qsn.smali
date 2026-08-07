.class public final synthetic Ll/qsn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ssn;


# direct methods
.method public synthetic constructor <init>(Ll/ssn;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qsn;->a:Ll/ssn;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qsn;->a:Ll/ssn;

    check-cast p1, Ljava/lang/Boolean;

    invoke-static {p0, p1}, Ll/ssn;->a(Ll/ssn;Ljava/lang/Boolean;)V

    return-void
.end method
