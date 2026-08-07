.class public final synthetic Ll/yyf0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/czf0;


# direct methods
.method public synthetic constructor <init>(Ll/czf0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yyf0;->a:Ll/czf0;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yyf0;->a:Ll/czf0;

    invoke-static {p0}, Ll/czf0;->z(Ll/czf0;)V

    return-void
.end method
