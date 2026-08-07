.class public final synthetic Ll/kky;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/lky;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Ll/lky;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kky;->a:Ll/lky;

    iput-boolean p2, p0, Ll/kky;->b:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/kky;->a:Ll/lky;

    iget-boolean p0, p0, Ll/kky;->b:Z

    check-cast p1, Ljava/lang/String;

    invoke-static {v0, p0, p1}, Ll/lky;->a(Ll/lky;ZLjava/lang/String;)V

    return-void
.end method
