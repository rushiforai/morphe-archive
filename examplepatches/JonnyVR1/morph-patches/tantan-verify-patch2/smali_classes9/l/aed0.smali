.class public final synthetic Ll/aed0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/zvk$b;


# instance fields
.field public final synthetic a:Ll/ced0;

.field public final synthetic b:[Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/ced0;[Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/aed0;->a:Ll/ced0;

    iput-object p2, p0, Ll/aed0;->b:[Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/aed0;->a:Ll/ced0;

    iget-object p0, p0, Ll/aed0;->b:[Ljava/lang/String;

    invoke-static {v0, p0, p1}, Ll/ced0;->d5(Ll/ced0;[Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
