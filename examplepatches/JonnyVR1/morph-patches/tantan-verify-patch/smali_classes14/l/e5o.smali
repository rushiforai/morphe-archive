.class public final synthetic Ll/e5o;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/i5o;

.field public final synthetic b:Ll/mvn;


# direct methods
.method public synthetic constructor <init>(Ll/i5o;Ll/mvn;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/e5o;->a:Ll/i5o;

    iput-object p2, p0, Ll/e5o;->b:Ll/mvn;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/e5o;->a:Ll/i5o;

    iget-object p0, p0, Ll/e5o;->b:Ll/mvn;

    check-cast p1, Ll/mvn;

    invoke-static {v0, p0, p1}, Ll/i5o;->S2(Ll/i5o;Ll/mvn;Ll/mvn;)V

    return-void
.end method
