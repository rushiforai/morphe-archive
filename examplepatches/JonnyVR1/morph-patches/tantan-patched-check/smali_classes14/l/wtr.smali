.class public final synthetic Ll/wtr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/eur;


# direct methods
.method public synthetic constructor <init>(Ll/eur;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wtr;->a:Ll/eur;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wtr;->a:Ll/eur;

    invoke-static {p0}, Ll/eur;->g0(Ll/eur;)V

    return-void
.end method
